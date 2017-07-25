class ResumeUploader < CarrierWave::Uploader::Base
  storage :file

  def content_type_whitelist
    %w(
      application/msword
      application/pdf
      application/vnd.openxmlformats-officedocument.wordprocessingml.document
    )
  end

  def extension_whitelist
    %w(doc docx pdf)
  end

  def store_dir
    'resumes'
  end
end
