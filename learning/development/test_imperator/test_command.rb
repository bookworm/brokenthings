require'imperator'
class CommandWithErrors < Imperator::Command
  def initialize
    super
    @errors = ActiveModel::Errors.new(self)
  end
end
class TestCommand < Imperator::CommandErrors
  action do
    @errors.add(:cats, "Dogs")
    return true
  end
end

command = TestCommand.new()
puts command.perform
puts "======= \n"
puts command.inspect
puts command.errors.inspect