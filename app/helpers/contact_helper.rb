module ContactHelper
  def draw_house_size_table(sizes)
    s = "<table><thead><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th></thead><tbody>"
    ["mm", "cm", "m"].each do |format|
      s << "<tr>"
      sizes.each { |size| s << "<td>#{get_size(size, format)}</td>" }
      s << "</tr>"
    end
    s << " </tbody></table>"
    raw s
  end

  private

  def get_size(size, format)
    case format
    when "mm"
      "#{(size * 1000).round(0)} mm"
    when "cm"
      "#{(size * 100).round(0)} cm"
    else
      "#{size} m"
    end
  end
end
