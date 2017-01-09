class Read < ApplicationRecord

  def self.read_count(link_id)
    where(link_id: link_id).count || 0
  end

  def self.top_reads
    group(:link_id).count
  end
end
