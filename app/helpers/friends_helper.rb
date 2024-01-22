# app/helpers/friends_helper.rb
module FriendsHelper
 
  def render_excel_content(excel_blob)
    # content = extract_excel_content(excel_blob)
    # render partial: 'excel_content', locals: { content: content }
  end
  

  def extract_excel_content(excel_blob)
    # return [] unless excel_blob&.attached?
  
    # # Check if the file is a valid zip file
    # return [] unless excel_blob.content_type == 'application/zip'
  
    # # Use the roo gem to parse the Excel file content
    # excel_data = Roo::Excelx.new(StringIO.new(excel_blob.download))
  
    # # Extract data into an array
    # excel_data.sheet(0).parse
  end
  
end
