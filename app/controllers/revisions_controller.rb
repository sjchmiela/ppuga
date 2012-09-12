# encoding: utf-8
class RevisionsController < ApplicationController
	before_filter :authenticate_admin, :only => [:change, :dismiss]
	expose(:phrase)
	expose(:revisions) {phrase.revisions.includes(:author).order('created_at desc')}
	expose(:revision)
	respond_to :html
	def change
		phrase.from_revision!(revision)
		if phrase.save
			flash[:notice] = "Zaktualizowano frazę."
		end
		redirect_to phrase
	end

	def dismiss
		phrase.updated_at = revision.created_at
		if phrase.save
			flash[:notice] = "Olano wersję."
		end
		redirect_to phrase
	end
end
