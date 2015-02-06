require('spec_helper')

describe(Entry) do
  it {should belong_to :skill}
  it {should belong_to :category}

  it("will always have a title") do
    entry = Entry.create(title: "")
    expect(Entry.all).to eq([])
  end

  it("will not have a rating higher than 5") do
    entry = Entry.create(title: "z", rating: 9)
    expect(Entry.all).to eq([])
  end

  describe("#date") do
    it("will return the date created in a pretty way") do
      entry = Entry.create(title: "a", rating: 2)
      day = entry.created_at.day
      month = entry.created_at.month
      year = entry.created_at.year
      pretty_date = "#{month}/#{day}/#{year}"
      expect(entry.date).to eq(pretty_date)
    end
  end

  it('will return the most recent entries') do
    skill = Skill.create(name: "a")
    skill2 = Skill.create(name: "b")
    entry1 = Entry.create(title: "x", rating: 5)
    entry = Entry.create(title: "y", rating: 4)
    skill.entries << entry1
    skill2.entries << entry
    expect(Entry.all).to eq([entry, entry1])
  end



end
