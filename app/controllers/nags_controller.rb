class NagsController < UITableViewController

  def viewDidLoad
    super
    @nags = NagsService.get_nags("ec40bf685bdd5c1bf504")

    @filtered_nags = @nags

    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self
    searchBar.showsCancelButton = true
    searchBar.sizeToFit
    view.tableHeaderView = searchBar

    view.backgroundColor = UIColor.whiteColor
    view.dataSource = view.delegate = self
    view.addSubview(@myTableView)
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @filtered_nags.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: @reuseIdentifier)
    end
    cell.textLabel.text = @filtered_nags[indexPath.row].contents
    cell.imageView.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString("https://upload.wikimedia.org/wikipedia/commons/8/8b/2010-07-20_Black_windup_alarm_clock_face.jpg")))
    cell.detailTextLabel.text = "Hi My name is mo"
    cell
  end

  def searchBarSearchButtonClicked(searchBar)
    @filtered_nags = @nags.select{ |n| n.contents.match(/#{searchBar.text}/i) }
    view.reloadData
    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    @filtered_nags = @nags
    searchBar.text = nil
    view.reloadData
    searchBar.resignFirstResponder
  end

  def searchBar(searchBar, textDidChange: text)
    @filtered_nags = @nags.select{ |n| n.contents.match(/#{text}/i) }
    view.reloadData
  end

end
