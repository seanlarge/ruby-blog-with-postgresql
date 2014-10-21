require 'rails_helper'

feature "Manage  Blog" do
  scenario "List blog entries" do
    visit blogs_path
    expect(page.find('h1')).to have_content(/Beer Blog/)
    expect(page).to have_content(/beer/i)
  end
  scenario "Create New Blog" do
    visit blogs_path

    click_on 'New Blog'
    fill_in 'Subject', with: 'New Beer Title'
    fill_in 'Body', with: 'this is some beer description'
    select '2014-10-20 23:09:00 UTC', with: 'Published'
    expect(current_path).to eq(new_blog_path)

    click_on 'Create Blog'
    expect(current_path).to eq(blog_path(Blog.last.id))
    # expect(find('.notice')).to have_content(/Successfully/i)

    click_on 'Back'
    expect(current_path).to eq(blogs_path)

  end

  scenario "Edit Blog" do
    visit blogs_path
    click edit_blog_path(Blog.last.id)
    fill_in 'Subject', with: 'Smash Mouth'
    fill_in 'Body', with: 'hoping this works'
    click_on 'Update Blog'

    expect(current_path).to eq(blog_path(Blog.last.id))
    expect(find('#notice')).to have_content(/updated/i)

  end


end # end of capybara test
