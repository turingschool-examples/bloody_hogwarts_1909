require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it ".average_age" do
      harry = Student.create(name: "Harry Potter", house: "Griffyndor", age: 14)
      casseopia = Student.create(name: "Casseopia Black", age: 19, house: "Slytherin")

      expect(Student.average_age).to eq(16.5)
    end
  end

end
