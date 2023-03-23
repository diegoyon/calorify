module ActivitiesHelper
  def set_color(consumed, total)
    if consumed > total
      "is-danger"
    elsif total == consumed
      "is-success"
    else
      "is-link"
    end
  end
end
