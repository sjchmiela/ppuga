# encoding: utf-8
class PhrasesController < ApplicationController
	before_filter :authenticate_author!, :except => [:show, :search, :index]
	expose(:phrase)
	expose(:phrases) {
		if !params[:search].nil?
				p = Phrase.search {
					fulltext params[:search] do
					phrase_fields :title => 5.0
					phrase_fields :description => 3.0
					phrase_slop 1
					end
					with :published, true
				}
			p.results
		else
			Phrase.order(:title)
		end
	}

	respond_to :html
	def search
		if params[:naked] == '1'
			render :layout => false
		end
	end

	def create
		if !author_signed_in?
			redirect_to new_author_session_path
		else
			if phrase.save
				revision = Revision.from_phrase(phrase)
				revision.author_id = current_author.id
				revision.save
				flash[:notice] = "Dodano frazę."
			end
			respond_with phrase
		end
	end

	def update
		if !author_signed_in?
			redirect_to new_author_session_path
		else
			if phrase.save
				revision = Revision.from_phrase(phrase)
				revision.author_id = current_author.id
				revision.save
				flash[:notice] = "Zaktualizowano frazę."
			end
			respond_with phrase
		end
	end

	def destroy
		if !author_signed_in?
			redirect_to new_author_session_path
		else
			revision = Revision.from_phrase(phrase)
			revision.author_id = current_author.id
			revision.save
			phrase.destroy
			flash[:notice] = "Usunięto frazę."
			redirect_to homepage_path
		end
	end
end
