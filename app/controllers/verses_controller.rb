class VersesController < ApplicationController

  before_action :set_chapter
  before_action :set_chapter_paths
  before_action :set_query

  def index
    verses
    set_display(params[:display])
  end

  def chapter
    verses
    set_display(params[:display])
    render :index
  end

  def set_version
    session[:version] = params[:version] if params[:version]
    redirect_back(fallback_location: root_path)
  end

  def search
    verses
    set_display :spaced
    @is_search = true
    render :index
  end

  private

  def set_display(display_view)
    @is_search = false
    session[:display_view] = display_view.to_sym
    @display_view = session[:display_view]
    @display_partial = (@display_view == :inline) ? 'verse_inline' : 'verse_spaced'
  end

  def display_view
    @display_view ||= :inline
  end

  def set_query
    @query = []
    if params[:q]
      @search_terms = params[:q].split(' ').compact
      @search_terms.each do |word|
        @query.push "text LIKE '%#{word}%'"
      end
    end
  end

  def set_chapter_paths
    @previous_chapter_path = "/chapter/#{@chapter.to_i - 1}"
    @next_chapter_path = "/chapter/#{@chapter.to_i + 1}"
  end

  def set_chapter
    @chapter = params[:chapter] || 1
  end

  def verses
    @verses = Book.where(name: 'Proverbs').first.verses.where(version: version)
    @verses = @verses.where(chapter: @chapter) if @chapter && @query.empty?
    if !@query.empty?
      counter = 0
      loop do
        break if counter == @query.length
        if counter == 0
          @verses = @verses.where(@query[counter])
        else
          @verses = @verses.or(Verse.where(@query[counter]))
        end
        counter += 1
      end
    end
    @verses
  end

  def version
    @version ||= Version.where(abbreviation: session[:version])
  end

end
