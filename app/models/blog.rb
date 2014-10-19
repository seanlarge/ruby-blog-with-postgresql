class Blog < ActiveRecord::Base

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
  # sort: display

end

end # end of class blog
