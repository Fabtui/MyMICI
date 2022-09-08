require 'rails_helper'

RSpec.describe Day, type: :model do
  context 'day persistence' do
    it "should persist a day" do
      u = User.create!(email: 'test@mail.com', password: 'azerty', sex: 'male', weight: 10)
      day_count = Day.count
      d = Day.new(date: Time.now, user_id: u.id)
      d.save
      # p d.errors.messages if d.errors.messages
      expect(Day.count).to eq(day_count + 1)
    end
  end

  context 'day association' do
    it 'should have a new pooh' do
      u = User.create!(email: 'test@mail.com', password: 'azerty', sex: 'male', weight: 10)
      d = Day.create(date: Time.now, user_id: u.id)
      p = Pooh.create(blood: true, rate: 9, day_id: d.id)
      expect(d.pooh.first).to eq(p)
    end
  end
end
