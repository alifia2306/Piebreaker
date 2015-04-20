class UsersController < ApplicationController
 

# require 'csv'    

# csv_text = File.read('/Users/ahaidry/Desktop/CIT_597/yelp_academic_dataset_business.csv')
# # puts csv_text
# csv = CSV.parse(csv_text, :headers => true)
# puts "csv check now"

# #if(csv != nil)
#   puts "wtffffff"
#   csv.each do |row|
#     puts "csv not empty"
#     # if(row != nil)
#       Users.create!({:business_id => row['business_id']})
#       puts row['business_id']
#       Users.create!({:full_address => row['full_address']})
#       if(row.has_key?('categories'))
#         puts row['categories']
#         category=""
#         row['categories'].split("'")[1...-1].each do |c|
#           if !c.eql?', u'
#             category=c+":"+category
#           end
#         end
#         Users.create!({:categories => category})
#       else
#         Users.create!({:categories => ""})
#       end
#       if(row.has_key?('city'))
#         puts row['city']
#         Users.create!({:city => row['city']})
#       else
#         Users.create!({:city=>""})
#       end
#       if(!row.has_key?('review_count'))
#         Users.create!({:review_count=>0})
#       else
#         Users.create!({:review_count=>row['review_count']})
#       end
#       Users.create!({:name => row['name']})
#       Users.create!({:state => row['state']})
#       Users.create!({:price_range => row['price_range']})
#       if(!row.has_key?('attributes.Wi-Fi'))
#         Users.create!({:wifi => row['attributes.Wi-Fi']})
#       else
#         Users.create!({:wifi=>false})
#       end
#       if(row.has_key?('attributes.Parking.street')||row.has_key?('attributes.Parking.garage')||row.has_key?('attributes.Parking.valet')||row.has_key?('attributes.Parking.lot'))
#         Users.create!({:parking => true})
#       else
#         Users.create!({:parking=>false})
#       end
#       # Users.create!({:parking => row['attributes.Parking']})
#       if(row.has_key?('attributes.Delivery'))
#         Users.create!({:delivery => true})
#       else 
#         Users.create!({:delivery => false})
#       end

#       if(row.has_key?('attributes.Outdoor Seating'))
#         Users.create!({:outdoor_seating => true})
#       else
#         Users.create!({:delivery => false})
#       end

#       if(row.has_key?('stars'))
#         Users.create!({:rating => true})
#       else
#         Users.create!({:delivery => false})
#       end
   # end
  # end
#end

 # GET /users/users_path
  # GET /users.json
  def index
    @users = User.all
    # @users = User.search(params[:search], params[:location])
    # puts @users
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = User.find(params[:id])
    @loc_empty=false
    if params[:location].empty?
      @loc_empty=true
    end
      if params[:search]
        @users=User.find(:all, :conditions => ['(full_address LIKE ? OR state LIKE ? OR city LIKE ?) AND (name LIKE ? OR categories LIKE ?)', "%#{params[:location]}%","%#{params[:location]}%","%#{params[:location]}%","%#{params[:search]}%","%#{params[:search]}%"])
      end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @users }
    end
  end

  def compare_selected
    
    @users_list=Array.new
    @coupons_list=Array.new
    @max_exceed=false
    @no_selections=false
    if params.has_key?(:ids)
      @no_selections=false

      if params[:ids].size>3
        @max_exceed=true
      end
      params[:ids].each do |id|
        puts id
        user = User.find(id)
        name = user.name
        puts name
        coupon = Coupon.where("username =?",name)
      
        @users_list.push(user)
        @coupons_list.push(coupon)
      end
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json=>{:users_list=> @users_list,:coupons_list=>@coupons_list }}
      end
    else
      @no_selections=true
      respond_to do |format|
        format.html
        format.json { render json=>{:users_list=> @users_list,:coupons_list=>@coupons_list }}
      end
    end

  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
