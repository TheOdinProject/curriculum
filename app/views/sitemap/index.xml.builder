xml.instruct!
xml.urlset(
  'xmlns'.to_sym => "http://www.sitemaps.org/schemas/sitemap/0.9",
  'xmlns:image'.to_sym => "http://www.google.com/schemas/sitemap-image/1.1"
) do

  # Root
  xml.url do
    xml.loc "#{root_url}"
    xml.changefreq("daily")
    xml.priority(1.00)
  end

  @static_pages.each do |page|
    xml.url do
      xml.loc "#{page}"
      xml.changefreq("monthly")
      xml.priority(0.80)
    end
  end

  # Main paths index
  xml.url do
    xml.loc "#{paths_url}"
    xml.changefreq("monthly")
    xml.priority(1.00)
  end

  # Individual courses and lessons
  @courses.each do |course|
    xml.url do
      xml.loc "#{path_course_url(course.path, course)}"
      xml.changefreq("weekly")
      xml.priority(0.80)
    end

    course.lessons.each do |lesson|
      xml.url do
        xml.loc "#{lesson_url(lesson)}"
        xml.lastmod lesson.updated_at.strftime("%F")
        xml.changefreq("daily")
        xml.priority(1.00)
      end
    end
  end
end
