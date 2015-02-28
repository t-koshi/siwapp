require 'spec_helper'

feature "Editing Recurring Invoices" do
  before  do
    FactoryGirl.create(:recurring_invoice)
    visit "/recurring_invoices"
    click_link 'Show'
    click_link "Edit Recurring Invoice"
  end

  scenario "Updating a recurring invoice" do
    fill_in "Customer name", with: "TextMate 2 beta"
    click_button "Update Recurring invoice"

    expect(page).to have_content("Recurring Invoice has been updated.")
  end

  scenario "Updating a recurring invoice with invalid attributes is bad" do
    fill_in "Customer name", with: ""
    click_button "Update Recurring invoice"
    expect(page).to have_content("Customer name can't be blank")
  end

end