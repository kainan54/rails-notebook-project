require 'faker'



rtf_content_example = Section.find(324).content;

# 200.times do 
#     User.create!(username: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: 'topsecret123', password_confirmation: 'topsecret123')
# end
40.times do
    # make a note_book
    note_book = NoteBook.create!(title: Faker::Hipster.unique.sentence(word_count: rand(1..3), supplemental: true, random_words_to_add: rand(1..4)), user_id: User.all.sample.id)


    # build 1-10 sections
    rand(1..10).times do
        note_book.sections.build(title: Faker::Hipster.unique.sentence(word_count: rand(1..3), supplemental: true, random_words_to_add: rand(1..4)), note_book_id: note_book.id).save!
    end

    # add rtf content to each section
    note_book.sections.each do |section|
        ActionText::RichText.create(record_type: 'Section', record_id: section.id, name: Faker::Hipster.unique.sentence(word_count: rand(1..3), supplemental: true, random_words_to_add: rand(1..4)), body: rtf_content_example)

        # add nested sections 1-4
        rand(1..4).times do
            section.sections.build(title: Faker::Hipster.unique.sentence(word_count: rand(1..3), supplemental: true, random_words_to_add: rand(1..4)), parent_section_id: section.id).save!
        end

        # add rtf to nested sections
        section.sections.each do |n1_section|
            ActionText::RichText.create(record_type: 'Section', record_id: n1_section.id, name: 'content', body: rtf_content_example)

            # add nested sections 1-4
            rand(1..4).times do
                n1_section.sections.build(title: Faker::Hipster.unique.sentence(word_count: rand(1..3), supplemental: true, random_words_to_add: rand(1..4)), parent_section_id: n1_section.id).save!
            end

            # add rtf to nested 2 sections
            n1_section.sections.each do |n2_section|
                ActionText::RichText.create(record_type: 'Section', record_id: n2_section.id, name: 'content', body: rtf_content_example)

                # add nested sections 1-2
                rand(1..2).times do
                    n2_section.sections.build(title: Faker::Hipster.unique.sentence(word_count: rand(1..3), supplemental: true, random_words_to_add: rand(1..4)), parent_section_id: n2_section.id).save!
                end

                n2_section.sections.each do |n3_section|
                    ActionText::RichText.create(record_type: 'Section', record_id: n3_section.id, name: 'content', body: rtf_content_example)
                end
            end
            
        end
    end

end
