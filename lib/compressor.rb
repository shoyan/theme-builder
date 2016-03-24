class Compressor
  def self.run(dir, name)
    `tar -zcvf #{dir} #{name}`
  end
end
