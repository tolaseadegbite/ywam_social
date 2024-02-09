me = User.create!(
    email: 'tolasekelvin@example.com',
    password: '123456',
    # password_confirmation: '123456',
    firstname: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    bio: Faker::Lorem.paragraphs.join("\n")
)

10.times do
    listing = Listing.create(
        host: me,
        title: Faker::Lorem.words.join(" "),
        about: Faker::Lorem.paragraphs.join("\n"),
        max_guests: (1..15).to_a.sample,
        address_line_1: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        status: [:draft, :published].sample
    )
end

10.times do
    host = User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        # password_confirmation: '123456',
        firstname: Faker::Name.first_name,
        surname: Faker::Name.last_name,
        username: Faker::Internet.user_name,
        bio: Faker::Lorem.paragraphs.join("\n")
    )

    10.times do
        listing = Listing.create!(
            host: host,
            title: Faker::Lorem.words.join(" "),
            about: Faker::Lorem.paragraphs.join("\n"),
            max_guests: (1..15).to_a.sample,
            address_line_1: Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state,
            country: Faker::Address.country,
            status: [:draft, :published].sample
        )
    end
end