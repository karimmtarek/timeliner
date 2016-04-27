require 'rails_helper'

describe "Blog" do
  let(:user) { FactoryGirl.create(:user, :confirmed) }

  before do
    login_as(user)
  end

  it 'Updates a blog post' do
    post = FactoryGirl.create(:post, user: user)

    visit posts_path
    click_on 'Edit'
    expect(current_path).to eq(edit_post_path(post))
    expect(page).to have_text('Post (Edit)')

    fill_in 'Title', with: "Blog post title"
    fill_in 'Body', with: "Blog post body"

    within '.stick-it-up' do
      click_button('Update')
    end

    expect(current_path).to eq(posts_path)
    expect(page).to have_text('Blog post title')
  end
end
