Promotion.class_eval do
  has_attached_file :leaderboard
  has_attached_file :half_leaderboard
  has_attached_file :full

  validates_attachment_content_type :leaderboard,{:content_type=> ["image/png","image/jpg","image/jpeg"],
                                            :message => I18n::t('flash.image_not_correct_content_type',:locale=>:it), :if => "leaderboard_file_name_changed?"}
  validates_attachment_content_type :half_leaderboard,{:content_type=> ["image/png","image/jpg","image/jpeg"],
                                            :message => I18n::t('flash.image_not_correct_content_type',:locale=>:it), :if => "half_leaderboard_file_name_changed?"}
  validates_attachment_content_type :full,{:content_type=> ["image/png","image/jpg","image/jpeg"],
                                            :message => I18n::t('flash.image_not_correct_content_type',:locale=>:it), :if => "leaderboard_file_name_changed?"}


  scope :today,where("starts_at >= ? and starts_at <= ?",Time.zone.now.beginning_of_day,Time.zone.now.end_of_day)
  scope :active_from_today, where("expires_at > ?", Time.zone.now.end_of_day)
end
