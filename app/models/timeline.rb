class Timeline
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end

  def milestones
    owner.milestones.load.order(date_start: :desc)
  end

  def viewable?(visitor)
    published? || owner?(visitor)
  end

  def published?
    !owner.maintenance_mode?
  end

  def owner?(visitor)
    visitor == owner
  end
end
