module ApplicationHelper
  def backbone_view
    [controller_name, action_name].map(&:camelcase).join
  end

  def to_top
    raw '<span class="to-top pull-right link"><i class="fa fa-chevron-up"></i></span>'
  end

  def zopim_chat
    if Rails.env.production?
      javascript_tag do
        raw script = <<-END.gsub(/^ {6}/, '')
          window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
          d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
          _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');
          $.src='//v2.zopim.com/?1ukyJzNT4XnVyN5YjeHoLJ5TrWvgCPkj';z.t=+new Date;$.
          type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
        END
      end
    end
  end
end
