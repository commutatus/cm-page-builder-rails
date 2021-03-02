import React from "react"
import PropTypes from "prop-types"
import PageBuilder from 'cm-page-builder'

class Content extends React.Component {
  constructor(props) {
		super(props)
  }


  _updatePageComponent = (id, data, type, key) => {}


  render () {
    return (
      <React.Fragment>
        <PageBuilder
           pageComponents={this.props.components}
           handleUpdate={this._updatePageComponent}
           updateComponentData={(data) =>
             { $(`#${this.props.input}`).val(JSON.stringify(data))}
           }
           showTitle={false}
           showEmoji={false}
           showPageInfo={false}
           useDirectStorageUpload={true}
           assetBaseUrl={ this.props.assetBaseUrl }
           meta={ {id: "debug"} }
           status={ this.props.status }
          />
      </React.Fragment>
    );
  }
}

Content.defaultProps = {
  status: 'Edit'
};

Content.propTypes = {
  input: PropTypes.string,
  components: PropTypes.array,
  assetBaseUrl: PropTypes.string,
  status: PropTypes.string
};
export default Content
