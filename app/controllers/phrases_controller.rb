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
  	phrase.save
  	redirect_to phrase
  end

  def update
  end

  def destroy
  end
end
