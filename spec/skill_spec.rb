require('spec_helper')

describe(Skill) do
  it {should have_many :entries}

  it("should always have a name") do
    skill = Skill.create(name: "")
    expect(Skill.all).to eq([])
  end

  describe("#level") do
    it("will return a skill's level (it's total rating /10)") do
      entry = Entry.create(title: "x", rating: 5)
      entry2 = Entry.create(title: "y", rating: 5)
      entry3 = Entry.create(title: "z", rating: 5)
      skill = Skill.create(name: "ruby")
      skill.entries << entry
      skill.entries << entry2
      skill.entries << entry3
      expect(skill.level).to eq(1)
    end
  end

  describe("#date") do
    it("will return the date created in a pretty way") do
      skill = Skill.create(name: "a")
      day = skill.created_at.day
      month = skill.created_at.month
      year = skill.created_at.year
      pretty_date = "#{month}/#{day}/#{year}"
      expect(skill.date).to eq(pretty_date)
    end
  end

  it 'will destroy its entries' do
    entry = Entry.create(title: "x", rating: 5)
    skill = Skill.create(name: "ruby")
    skill.entries << entry
    skill.destroy
    expect(Entry.all).to eq([])
  end

  it 'will sort alphabetically by default' do
    skill = Skill.create(name: "Ruby")
    skill2 = Skill.create(name: "PHP")
    skill3 = Skill.create(name: "C+")
    expect(Skill.all).to eq([skill3,skill2, skill])
  end

  it 'will always be capitalized' do
    skill = Skill.create(name: "ruby")
    expect(Skill.all.first.name).to eq("Ruby")
  end
end
