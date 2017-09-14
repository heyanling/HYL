class Article < ApplicationRecord
 self.table_name = 'articles'

  has_attached_file :image,
                    :style =>{:small =>'150*150'},
                    :url =>'/images/:id/:style/:basename.:extension',
                    :path =>':rails_root/public/images/:id/:style/:basename.:extension'

  validates_attachment_presence :image
  validates_attachment_size :image,:less_than => 5.megabytes
  validates_attachment_content_type :image,:content_type =>%w(image/jpeg image/png)


end
