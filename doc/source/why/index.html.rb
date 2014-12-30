module Views
  module Why
    class Index < Views::Shared::Base
      def content
        container {
          jumbotron {
            h2 "Why use Fortitude?"
          }

          row {
            columns(:small => 3) { }
            columns(:small => 7) {
              bang_intro

              p {
                text %{But, of course, good programmers wouldn’t just take our word for it.
Below are seven short examples that give you a quick }
                em "tour de force"
                text %{ showing what makes Fortitude so compelling.}
              }

              small_pullquote {
                text %{Fortitude offers }
                a("many other benefits", :href => "/why/other_benefits.html")
                text %{, too. It’s incredibly fast (20–40% faster than ERb, 4–5x faster than HAML),
provides extremely powerful debugging and validation tools, and is almost certainly
compatible with any stack you’re using.}
              }

              h3 "How Does it Work?"

              p {
                text %{Fortitude expresses your views as Ruby code. By doing this, it allows you to
bring all the power of Ruby to bear on your views. As they grow in size, difference this makes is enormous.}
              }

              factoring_out_commonality_example
            }
            columns(:small => 2) { }
          }
        }
      end

      def bang_intro
        p %{There is exactly one overwhelming reason to use Fortitude:}

        emphatic_pullquote %{It allows you to write vastly better-factored views.}

        p %{This means:}

        ul {
          li "You’ll be able to enhance, modify, and debug views much faster."
          li %{You’ll build new views faster — and this pace will accelerate as
your codebase grows, not decelerate.}
          li "You’ll have fewer bugs in your views, and spend less time debugging them."
          li {
            text "You’ll "
            em "enjoy"
            text " building views much more."
          }
        }
      end

      def factoring_out_commonality_example
        h4 "Factoring Out Commonality"

        p %{Let’s start small. This is a piece of code that, combined with appropriate CSS,
renders an “icon button” — a button consisting of a small icon, with a tooltip available:}

        erb 'icon_button_instance_1.html.erb', <<-EOS
<a href='<%= conditional_refresh_url(:user => @user) %>' class="button icon refresh">
  <span class="button_text">
    <span>Refresh this page, <strong>only</strong> if content has changed</span>
  </span>
</a>
EOS

        p %{When rendered, this button looks something like the following when you hover over it:}

        featured_image 'why/icon_button.png'

        p {
          text %{Isn’t that attractive? In fact, it’s }
          em "so"
          text %{ attractive that we’d like to use it everywhere. As we do, however, we run into a problem: we are }
          a("repeating ourselves", :href => 'dont_repeat_yourself')
          text %{, which we know is bad.}
        }
      end
    end
  end
end
