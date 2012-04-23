module ApplicationHelper
  # SnapShot
  def chart_link market, demog, format

    snapshot = @snapshots.find {|s| s.market.id == market.id && s.demog.id == demog.id && s.format.id == format.id }
    snapshot_id = snapshot.try(:id)
    displayed = @chart_ids.include?(snapshot_id.to_s)
    content_tag :td,
                link_to_if(snapshot && !displayed, market.name.first, refinery.snapshots_snapshots_path(:id => snapshot_ids(snapshot_id))),
                :class =>(chart_link_class(displayed, snapshot))
  end

  def chart_link_class(displayed, snapshot)
    displayed ? "snapshot_displayed" : (snapshot ? "" : "snapshot_missing")
  end

  def snapshot_ids snapshot_id
    ids = @chart_ids.clone
    ids << snapshot_id unless snapshot_id.nil?
    ids.join(",")
  end

  def path_with_removed snapshot_id
    ids = @chart_ids.clone
    ids.delete(snapshot_id.to_s)

    refinery.snapshots_snapshots_path(:id => ids.join(","))
  end
end
