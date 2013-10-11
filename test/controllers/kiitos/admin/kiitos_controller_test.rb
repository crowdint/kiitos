require 'test_helper'

describe Kiitos::Admin::KiitosController do
  before do
    @routes = Kiitos::Engine.routes
    User.create name: 'User Name', email: 'test@example.com'
  end

  describe 'GET :index' do
    before do
      get :index
    end

    it 'renders the index template' do
      response.must_render_template :index
    end

    it 'assigns the kiito instance variable' do
      assigns(:kiito).must_be_instance_of Kiitos::Kiito
    end
  end

  describe 'POST :create' do
    context 'with valid information' do
      it 'redirects to index' do
        post :create, kiito: {
          title: 'test',
          kiitos_category_id: 1,
          description: 'test',
          image: 'test_image.png',
          state: 'enabled'
        }
        response.must_redirect_to admin_kiitos_path
      end

      it 'creates a new Kiito' do
        count = Kiitos::Kiito.count
        post :create, kiito: {
          title: 'test',
          kiitos_category_id: 1,
          description: 'test',
          image: 'test_image.png',
          state: 'enabled'
        }
        Kiitos::Kiito.count.must_equal count + 1, 'A kiito was not created'
      end
    end

    context 'with invalid information' do
      it 'should not create a new kiito' do
        count = Kiitos::Kiito.count
        post :create, kiito: { title: '' }
        assert Kiitos::Kiito.count.must_equal count, 'A kiito was created'
      end
    end
  end

  describe 'GET :edit' do
    it 'renders the edit template' do
      kiito = Kiitos::Kiito.create(
        title: 'test',
        kiitos_category_id: 1,
        description: 'test',
        image: 'test_image.png',
        state: 'enabled'
      )
      get :edit, id: kiito.id
      response.must_render_template :edit
    end
  end

  describe 'PUT :update' do
    before do
      @kiito = Kiitos::Kiito.create(
        title: 'test',
        kiitos_category_id: 1,
        description: 'test',
        image: 'test_image.png',
        state: 'enabled'
      )
    end
    context 'valid information' do
      it 'redirects to edit page' do
        put :update, id: @kiito.id, kiito: {
          title: 'test',
          kiitos_category_id: 1,
          description: 'test',
          image: 'test_image.png',
          state: 'enabled'
        }
        response.must_redirect_to edit_admin_kiito_path(@kiito)
      end
    end

    context 'invalid information' do
      it 'renders the edit page' do
        put :update, id: @kiito.id, kiito: { title: '' }
        response.must_render_template :edit
      end
    end
  end
end
