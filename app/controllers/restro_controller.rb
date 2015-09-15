class RestroController < UITableViewController

  def viewDidLoad
    super
    @restaurants = [
      Restaurant.new({
        name: "Sumiao's Hometown",
        thumb_image_url: nil,
        food_type: "Hunan",
        desc: "Awesome high class authentic Hunan restaurant with an awesome owner"
      }),
      Restaurant.new({
        name: "Domino's",
        thumb_image_url: nil,
        food_type: "Pizza",
        desc: "Great for your munchies"
      })
    ]

    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style: UITableViewStylePlain)
    @myTableView.dataSource = self
    @myTableView.delegate = self
    view.addSubview(@myTableView)
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @restaurants.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
    end
    cell.textLabel.text = @restaurants[indexPath.row].name
    cell
  end

end
