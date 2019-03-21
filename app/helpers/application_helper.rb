module ApplicationHelper
  def progress_bar_width(base: base, current: current )
    min_size = 15
    percents = current / base * 100
    percents = percents < min_size ? min_size : percents
  end

  def socials
    Social.all
  end

end
