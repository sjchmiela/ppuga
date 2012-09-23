# encoding: utf-8
class PhrasesController < ApplicationController
	require 'wikipedia'
	before_filter :authenticate_author!, :except => [:show, :search, :index, :wikishow]
	before_filter :authenticate_admin, :only => [:unpublished, :unupdated, :publish]
	expose(:phrase)
	expose(:phrases) {
		if !params[:search].nil?
			p = Phrase.find_by_sql ["SELECT phrases.*, groups.slug as group_slug FROM `phrases` left outer join groups on groups.id=phrases.group_id WHERE MATCH (phrases.title, phrases.description) AGAINST (?) AND published = 1;", params[:search]]
		else
			Phrase.where('published = 1').order(:title)
		end
	}
	expose(:unpublished_phrases) {
		Phrase.where('published=0')
	}
	expose(:unupdated_revisions) {
		Revision.find_by_sql("select authors.email, revisions.*, phrases.slug as slug from revisions left outer join authors on authors.id=revisions.author_id left outer join phrases on revisions.phrase_id = phrases.id where phrases.updated_at < revisions.created_at;")
	}
	expose(:wikiphrases) {
		Wikipedia.search(params[:search])
	}
	expose(:wikiphrase) {
		Wikipedia.show(params[:title])
	}

	respond_to :html
	def search
		if params[:naked] == '1'
			render :layout => false
		end
	end

	def publish
		phrase.published = 1
		if phrase.save
			flash[:notice] = "Opublikowano frazę."
		end
		redirect_to phrase
	end

	def create
		if current_author.can_publish?
			if phrase.save
				revision = Revision.from_phrase(phrase)
				revision.author_id = current_author.id
				revision.save
				flash[:notice] = "Dodano frazę."
			end
		else
			phrase.published = false
			if phrase.save
				revision = Revision.from_phrase(phrase)
				revision.author_id = current_author.id
				revision.save
				flash[:notice] = "Dodano nową wersję frazy do akceptacji przez moderatorów."
			end
		end
		respond_with phrase
	end

	def update
		if current_author.can_publish?
			if phrase.save
				revision = Revision.from_phrase(phrase)
				revision.author_id = current_author.id
				revision.save
				flash[:notice] = "Zaktualizowano frazę."
			end
		else
			revision = Revision.from_phrase(phrase)
			revision.author_id = current_author.id
			revision.save
			flash[:notice] = "Dodano wersję frazy do akceptacji przez moderatorów."
		end
		respond_with phrase
	end

	def destroy
		if current_author.can_publish?
			revision = Revision.from_phrase(phrase)
			revision.author_id = current_author.id
			revision.save
			phrase.destroy
			flash[:notice] = "Usunięto frazę."
			redirect_to homepage_path
		else
			flash[:notice] = "Nie masz uprawnień do usuwania fraz. Przykro nam. (Tak serio to nie, ale trudno.)"
			redirect_to phrase
		end
	end
end
