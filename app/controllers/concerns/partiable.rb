module Partiable
  extend ActiveSupport::Concern

  def org_party(full_name)
    make_party('ORGANIZATION', full_name)
  end

  def person_party(full_name)
    make_party('PERSON', full_name)
  end

  private

  def make_party(party_type, full_name)
    Party.create({ full_name:, party_type:, created_by_id: current_user.id })
  end
end
