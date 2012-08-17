# encoding: utf-8
class PhrasesController < ApplicationController
  expose(:phrase)
  expose(:phrases) {
  	p = Phrase.search {fulltext params[:search] do
	  	phrase_fields :title => 5.0
	  	phrase_fields :description => 3.0
	  	phrase_slop 1
	  	end
	  }
	p.results
  }

  respond_to :html

  def create
  	if phrase.save
      revision = Revision.from_phrase(phrase)
      revision.author_id = current_author.id
      revision.save
      flash[:notice] = "Dodano frazę."
    end
  	respond_with phrase
  end

  def update
    if phrase.save
      revision = Revision.from_phrase(phrase)
      revision.author_id = current_author.id
      revision.save
      flash[:notice] = "Zaktualizowano frazę."
    end
    respond_with phrase
  end

  def destroy
    revision = Revision.from_phrase(phrase)
    revision.author_id = current_author.id
    revision.save
    phrase.destroy
    flash[:notice] = "Usunięto frazę."
    redirect_to homepage_path
  end
end
