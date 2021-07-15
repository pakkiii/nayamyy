module LightsHelper
  def light_form(light)
    @visitor = light.visitor
    @yell = nil
    @visitor_yell = light.yell_id
    case light.action
    when 'follow'
      tag.a(light.visitor.name, href: user_path(@visitor)) + 'があなたをフォローしました'
    when 'like'
      tag.a(light.visitor.name, href: user_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: life_path(light.life_id)) + 'にいいねしました'
    when 'yell' then      
      @yell = Yell.find_by(id: @visitor_yell)
      @yell_content =@yell.content
      @life_title =@yell.life.title
      tag.a(@visitor.name, href: user_path(@visitor)) + 'が' + tag.a("#{@life_title}", href: life_path(light.life_id)) + 'にコメントしました'
    end
  end
end
