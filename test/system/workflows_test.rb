require "application_system_test_case"

class WorkflowsTest < ApplicationSystemTestCase
  setup do
    @workflow = workflows(:one)
  end

  test "visiting the index" do
    visit workflows_url
    assert_selector "h1", text: "Workflows"
  end

  test "should create workflow" do
    visit workflows_url
    click_on "New workflow"

    fill_in "Created by", with: @workflow.created_by_id
    fill_in "Discarded at", with: @workflow.discarded_at
    fill_in "Discarded by", with: @workflow.discarded_by_id
    fill_in "Name", with: @workflow.name
    fill_in "State", with: @workflow.state
    fill_in "Updated by", with: @workflow.updated_by_id
    click_on "Create Workflow"

    assert_text "Workflow was successfully created"
    click_on "Back"
  end

  test "should update Workflow" do
    visit workflow_url(@workflow)
    click_on "Edit this workflow", match: :first

    fill_in "Created by", with: @workflow.created_by_id
    fill_in "Discarded at", with: @workflow.discarded_at
    fill_in "Discarded by", with: @workflow.discarded_by_id
    fill_in "Name", with: @workflow.name
    fill_in "State", with: @workflow.state
    fill_in "Updated by", with: @workflow.updated_by_id
    click_on "Update Workflow"

    assert_text "Workflow was successfully updated"
    click_on "Back"
  end

  test "should destroy Workflow" do
    visit workflow_url(@workflow)
    click_on "Destroy this workflow", match: :first

    assert_text "Workflow was successfully destroyed"
  end
end
