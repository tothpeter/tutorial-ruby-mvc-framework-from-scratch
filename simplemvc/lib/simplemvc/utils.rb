class String
  def underscore
    gsub(/::/, '/')
    .gsub(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2') # FOOBar => foo_bar
    .gsub(/([a-z\d])([A-Z])/,'\1_\2')       # FO88OBar => fo86_o_bar
    .tr("-", "_")
    .downcase
  end

  def camelize
    return self if self !~ /_/ && self =~ /[A-Z]+.*/

    gsub('-', '_').split('_').map(&:capitalize).join
  end
end
