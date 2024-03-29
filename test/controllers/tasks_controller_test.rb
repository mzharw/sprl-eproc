require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { created_by_id: @task.created_by_id, data: @task.data, id: @task.id, name: @task.name, number: @task.number, state: @task.state, taskable_id: @task.taskable_id, taskable_type: @task.taskable_type, updated_by_id: @task.updated_by_id, user_id: @task.user_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { created_by_id: @task.created_by_id, data: @task.data, id: @task.id, name: @task.name, number: @task.number, state: @task.state, taskable_id: @task.taskable_id, taskable_type: @task.taskable_type, updated_by_id: @task.updated_by_id, user_id: @task.user_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
