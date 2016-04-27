require 'rails_helper'

describe "Blog" do
  let(:user) { FactoryGirl.create(:user, :confirmed) }

  before do
    sign_in(user)
  end

  it 'Creates a blog post' do
    visit user_path(user)
    expect(current_path).to eq(user_path(user))

    click_on 'Post'
    expect(current_path).to eq(new_post_path)
    expect(page).to have_text('Post (Create)')

    fill_in 'Title', with: "Blog post title"
    fill_in 'Body', with: "Blog post body"
    # fill_in 'Tags', with: "Ruby, Rails, HTML"
    # fill_in 'Published', with: Date.today

    within '.stick-it-up' do
      click_button('Create')
    end

    expect(current_path).to eq(posts_path)
    expect(page).to have_text('Blog post title')

    click_on 'Delete'

    expect(page).to have_text('Post destroy')
  end
end
