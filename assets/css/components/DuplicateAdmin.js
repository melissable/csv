import React from "react";
import { Table } from "reactstrap";
import _ from "lodash";

export default function DuplicateAdmin(props) {

  if (!props.data || props.data.length < 1) return null;
  return (
    <Table size="sm" hover striped responsive>
      <thead>
        <tr>
          <th>Matched by</th>
          <th>Value</th>
          <th>Possible duplicates</th>
        </tr>
      </thead>
      <tbody>
        {_.map(props.data, (x, index) => {
          return <tr key={`duplicateRow${index}`}>
            <td>{x.match_key}</td>
            <td>{x.matched_value}</td>
            <td>
              {_.map(x.list, (e) => {
                return (
                  <div className="d-block mb-2">
                    {e.first_name} {e.last_name}
                    <br />
                    {e.email}
                    <br />
                    {e.phone}
                  </div>
                );
              })}
            </td>
          </tr>;
        })}
      </tbody>
    </Table>
  );
}
