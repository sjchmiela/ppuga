class RevisionsController < ApplicationController
expose(:phrase)
expose(:revisions) {phrase.revisions.includes(:author).order('created_at desc')}
expose(:revision)
respond_to :html
end
