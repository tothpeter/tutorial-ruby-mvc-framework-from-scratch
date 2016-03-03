class Object
  def self.const_missing const
    require const.to_s.downcase
    const
  end
end

Object.const_get "Erubis"