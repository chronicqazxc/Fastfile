require './ShellScript.rb'

def create_folder_in_team_drive(folder_title)
    create_google_drive_folder(
                               drive_keyfile: "#{pwd}/drive_keyfile.json",
                               folder_id: '0B9FLMKfTaZZ4UXc5TDdEOF9WX2M',
                               folder_title: folder_title
                               )
end

def upload_file_to(folder_id, files)
    upload_to_google_drive(
                           drive_keyfile: "#{pwd}/drive_keyfile.json",
                           service_account: false,
                           folder_id: folder_id,
                           upload_files: files
                           )
end

# Function testing
desc "Create folder on GoogleDrive and upload files test."
lane :create_and_upload_file_test do
    create_folder_in_team_drive('fastlane_created')
    folder_id = Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::GDRIVE_CREATED_FOLDER_ID].to_s
    upload_file_to(folder_id, ["#{pwd}/report.xml", "#{pwd}/GoogleDrive.rb"])
end
