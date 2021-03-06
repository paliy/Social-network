require 'spec_helper'

describe "Authentication" do
  subject { page }
    
    describe "signin" do
     before { visit signin_path }    

      describe "signin page" do
        before { visit signin_path }

        describe "with invalid information" do
         let(:users) { FactoryGirl.create(:users) }
         before do
          fill_in "Email",    with: user.email.upcase
          fill_in "Password", with: user.password
          click_button "Sign in"
          it { should have_title('Sign in') }
          it { should have_selector('div.alert.alert-error') }
        
          it { should have_title(user.name) }
          it { should have_link('Profile',     href: user_path(user)) }
          it { should have_link('Sign out',    href: signout_path) }
          it { should_not have_link('Sign in', href: signin_path) }

    	  
            describe "followed by signout" do
              before { click_link "Sign out" }
              it { should have_link('Sign in') }
            end
         end
        end
      end
    end
end