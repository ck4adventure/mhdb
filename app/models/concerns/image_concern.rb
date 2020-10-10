module ImageConcern
  include ActiveSupport::Concern
  def image_path
    './' + self.name.delete("'").split(" ").join('_').downcase
  end
end