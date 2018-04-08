class VersesController < ApplicationController

  before_action :set_chapter
  before_action :set_chapter_paths

  def index
    verses
    set_display_settings
  end

  def chapter
    verses
    set_display_settings
    render :index
  end

  def set_version
    session[:version] = params[:version] if params[:version]
    redirect_back(fallback_location: root_path)
  end

  private

  def set_display_settings
    if params[:display]
      session[:display_view] = params[:display]
    end
    @display_view = session[:display_view]
    @display_partial = (@display_view == 'inline') ? 'verse_inline' : 'verse_spaced'
  end

  def display_view
    @display_view ||= 'inline'
  end

  def set_chapter_paths
    @previous_chapter_path = "/chapter/#{@chapter.to_i - 1}"
    @next_chapter_path = "/chapter/#{@chapter.to_i + 1}"
  end

  def set_chapter
    @chapter = params[:chapter] || 1
  end

  def verses
    verses = Book.where(name: 'Proverbs').first.verses.where(version: version)
    @verses = verses.where(chapter: @chapter) if @chapter
  end

  def version
    @version ||= Version.where(abbreviation: session[:version])
  end

end
