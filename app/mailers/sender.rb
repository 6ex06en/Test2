class Sender < ActionMailer::Base
  default from: "testmailrails@gmail.com"

  def map_to_email(person, map, link)
    @person = person
    @map = map
    @link = my_map_url(map.id)
    mail(to: person.email, subject: "Link to map")
  end
end
