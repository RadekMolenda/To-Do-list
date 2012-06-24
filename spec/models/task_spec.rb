require 'spec_helper'

describe Task do
  it { should have_fields :description, :deadline, :completed }
  it { should validate_presence_of(:description) }
end
