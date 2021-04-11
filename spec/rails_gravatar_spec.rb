$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "rails_gravatar"

describe RailsGravatar do
  describe ".src" do
    it "works with email" do
      expect(
        RailsGravatar.src("me@email.com")
      ).to eq(
        "//www.gravatar.com/avatar/8f9dc04e6abdcc9fea53e81945c7294b?s=64"
      )
    end

    it "works with optional size" do
      expect(
        RailsGravatar.src("me@email.com", 32)
      ).to eq(
        "//www.gravatar.com/avatar/8f9dc04e6abdcc9fea53e81945c7294b?s=32"
      )
    end

    it "works with optional size and default image url" do
      expect(
        RailsGravatar.src("me@email.com", 32, "http://email.com/image.png")
      ).to eq(
        "//www.gravatar.com/avatar/8f9dc04e6abdcc9fea53e81945c7294b?s=32&d=http%3A%2F%2Femail.com%2Fimage.png"
      )
    end

    describe "size" do
      it "should force a size greater than 1" do
        expect(
          RailsGravatar.src("me@email.com", -1, "http://email.com/image.png")
        ).to include (
          "s=1"
        )
      end
      it "should force a size less than 2048" do
        expect(
          RailsGravatar.src("me@email.com", 2080, "http://email.com/image.png")
        ).to include (
          "s=2048"
        )
      end
    end
  end

  describe ".tag" do
    it "works with email" do
      expect(
        RailsGravatar.tag("me@email.com")
      ).to eq(
        "<img src=\"//www.gravatar.com/avatar/8f9dc04e6abdcc9fea53e81945c7294b?s=64\" class=\"gravatar\"></img>"
      )
    end

    it "works with optional size" do
      expect(
        RailsGravatar.tag("me@email.com", 32)
      ).to eq(
        "<img src=\"//www.gravatar.com/avatar/8f9dc04e6abdcc9fea53e81945c7294b?s=32\" class=\"gravatar\"></img>"
      )
    end

    it "works with optional size and default image url" do
      expect(
        RailsGravatar.tag("me@email.com", 32, "http://email.com/image.png", 'The image alt text')
      ).to eq(
        "<img src=\"//www.gravatar.com/avatar/8f9dc04e6abdcc9fea53e81945c7294b?s=32&amp;d=http%3A%2F%2Femail.com%2Fimage.png\" class=\"gravatar\" alt=\"The image alt text\"></img>"
      )
   end
  end

  describe ".prefetch_dns_tag" do
    it "works with email" do
      expect(
        RailsGravatar.prefetch_dns_tag
      ).to eq(
        "<link rel=\"dns-prefetch\" href=\"//gravatar.com\"></link>"
      )
    end
  end

  describe "Thredded usage" do
    it "example src call" do
      user = double(:user, id: 2, name: "Margret", email: "USER34@example.com", admin: false)
      expect(
        RailsGravatar.src(user.email, 156, "retro")
      ).to eq(
        "//www.gravatar.com/avatar/8b5770882d6991af57d599e502429380?s=156&d=retro"
      )
    end
  end
end