module CommonMethods
  def to_s
    name
  end

  def inspect
    %{#<#{self.class} code: #{code}, name: #{name}>}
  end
end