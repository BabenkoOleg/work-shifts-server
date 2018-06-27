ActiveAdmin.register_page 'Emails from file' do
  menu parent: 'Emails', label: 'Import from file'

  content do
    @result = AllowedEmailLoading::Result.find_by(id: params[:result_id])
    render partial: 'emails_from_file', locals: { result: @result }
  end

  action_item :import_from_file, only: :index do
    link_to 'Back to emails', admin_allowed_emails_path
  end

  page_action :create, method: :post do
    loader = AllowedEmailLoaders::FromXlsx.new(
      params[:file], current_user, current_business
    )
    result = loader.parse!
    redirect_to admin_emails_from_file_path(result_id: result.id)
  end

  page_action :download_example, method: :get do
    send_file 'public/emails_example.xlsx',
              type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  end
end
