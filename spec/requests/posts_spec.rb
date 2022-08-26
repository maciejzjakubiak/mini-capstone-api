require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "Return posts" do
      user = User.create!(name: "Peter", email: "peter@text.com", password: "password")
      Post.create!(user_id: user.id, title: "testing", body: "blablablablablalbblablablablabla", image: "picture.test")

      get "/posts.json"
      post = JSON.parse(response.body)

      expect(response).to have_http_status(200)
    end
  end
  describe "GET /posts/:id" do
    it "should return a post with appropriate value" do
      user = User.create!(name: "Peter Parker", email: "spidey@text.com", password: "password")
      Post.create!(user_id: user.id, title: "testing2", body: "blablablablablalbblablablablabla2", image: "picture.test2")
      post_id = Post.first.id
      get "/posts/#{post_id}.json"
      post = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(post["title"]).to eq ("testing2")
    end
  end

  describe "POST /posts" do
    it "should create a post" do
      user = User.create!(name: "Peter Parker7", email: "spidey@text.com", password: "password")
      jwt = JWT.encode(
        { user_id: user.id },
        Rails.application.credentials.fetch(:secret_key_base), "HS256"
      )
      post "/posts.json", params: {
                            title: "testtest",
                            body: "testing",
                            image: "jpg.jpg.com,",
                          }, headers: { "Authorization" => "Bearer #{jwt}" }

      post = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end
end
