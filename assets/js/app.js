import React, { useEffect, useState } from "react";
import { Button, Row, Col, Container } from "reactstrap";
import Select from "react-select";

import "../css/app.scss";
import "bootstrap/dist/css/bootstrap.min.css";

import { Upload, DuplicateAdmin } from "../css/components";
import { api, csv_helper as csv } from "../utils";

const strategyOptions =[
  {label: "Phone or Email", value: "email,phone"},
  {label: "Phone", value: "phone"},
  {label: "Email", value: "email"},
]

export default function App() {
  const [data, setData] = useState();
  const [loading, setLoading] = useState(false);
  const [strategy, setStrategy] = useState(strategyOptions[0])
  const [file, setFile] = useState(false);

  function processData() {
    if (!loading) {
      setLoading(true);
      
      const formData = new FormData();
      formData.append("file", file);
      formData.append("strategy", strategy.value)
      api.post_form_data('process_csv', formData)
        .then(response => {
          setData(response?.data)
        })
        .catch(error => console.log('csv api error', error))
        .finally(() => setLoading(false))
    }
  }

  useEffect(() => {
    processData()
  }, [file, strategy])

  return (
    <Container> 
      <Row>
        <Col>
          <h1>CSV Parser</h1>
        </Col>
      </Row>
      <Row>
        <Col>
          <h4>Strategy</h4>
          <Select
            options={strategyOptions}
            value={strategy}
            onChange={setStrategy}
          />
        </Col>
      </Row>
      <Row>
        <Col>
          <Upload
            uploadSuccess={setFile}
            uploadFailure={(err) => { console.log('error', err)}}
          />
        </Col>
      </Row>
      <Row className="text-start">
        <Col>
          <DuplicateAdmin
            data={data}
          />
        </Col>
      </Row>
    </Container>
  );
}
