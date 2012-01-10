class HomeResource < ActiveRecord::Base

  has_attached_file :claim, :styles => { :thumb => ["338x19", :png]}
  has_attached_file :iconic, :styles => {:thumb => ["141x79", :png] }
  has_attached_file :background, :styles => { :thumb => ["141x44", :png]}
  has_attached_file :logo, :styles => {:top=>["284x92",:png], :thumb => ["141X50", :png]}
  has_attached_file :leaderboard, :styles => { :top => ["963x85", :png],:thumb => ["141X44", :png]}
  has_attached_file :head_background, :styles => { :top => ["1380x113", :png],:thumb => ["141X44", :png]}



  validates_attachment_content_type :claim,{:content_type=> ["image/png","image/jpg","image/jpeg"], :message => I18n::t('flash.image_not_correct_content_type',:locale=>:it), :if => "claim_file_name_changed?"}
  validates_attachment_content_type :background,{:content_type=> ["image/png","image/jpg","image/jpeg"], :message => I18n::t('flash.image_not_correct_content_type'), :if => "background_file_name_changed?"}
  validates_attachment_content_type :logo,{:content_type=> ["image/png","image/jpg","image/jpeg"] , :message => I18n::t('flash.image_not_correct_content_type'), :if => "logo_file_name_changed?"}
  validates_attachment_content_type :iconic,{:content_type=> ["image/png","image/jpg","image/jpeg"], :message => I18n::t('flash.image_not_correct_content_type'), :if => "iconic_file_name_changed?"}
  validates_attachment_content_type :leaderboard,{:content_type=> ["image/png","image/jpg","image/jpeg"], :message => I18n::t('flash.image_not_correct_content_type'), :if => "leaderboard_file_name_changed?"}
  validates_attachment_content_type :head_background,{:content_type=> ["image/png","image/jpg","image/jpeg"], :message => I18n::t('flash.image_not_correct_content_type'), :if => "head_background_file_name_changed?"}



  validates_attachment_size :claim, :less_than => 70.kilobytes , :message => I18n::t('flash.image_size',:size=>"70KB"),  :if => Proc.new { |imports| !imports.claim.file? }
  validates_attachment_size :background, :less_than => 70.kilobytes , :message => I18n::t('flash.image_size',:size=>"70KB"), :if => "background_file_name_changed?"
  validates_attachment_size :logo, :less_than => 100.kilobytes    , :message => I18n::t('flash.image_size',:size=>"40KB")      , :if => "logo_file_name_changed?"
  validates_attachment_size :iconic, :less_than => 70.kilobytes   , :message => I18n::t('flash.image_size',:size=>"70KB")     ,  :if => Proc.new { |imports| !imports.iconic.file? }
  validates_attachment_size :leaderboard, :less_than => 70.kilobytes   , :message => I18n::t('flash.image_size',:size=>"70KB")     ,  :if => Proc.new { |imports| !imports.leaderboard.file? }
  validates_attachment_size :head_background, :less_than => 20.kilobytes   , :message => I18n::t('flash.image_size',:size=>"20KB")     ,  :if => Proc.new { |imports| !imports.head_background.file? }

  # validates_attachment_presence  :iconic  , :message => I18n::t('flash.image_mandatory')
  #validates_attachment_presence  :background    , :message => I18n::t('flash.image_mandatory')
  #validates_attachment_presence  :logo       , :message => I18n::t('flash.image_mandatory')
end
